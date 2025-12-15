(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v2)
		(pred_4 ?v6)
		(pred_3 ?v1)
		(pred_6 ?v1)
		(pred_1 ?v6 ?v1)
		(pred_2)
		(pred_5 ?v6))

   (:action op_3
       :parameters  (?v8 ?v4)
       :precondition (and (not-eq ?v8 ?v4) 
                          (pred_3 ?v8) (pred_3 ?v4) (pred_6 ?v8))
       :effect (and  (pred_6 ?v4)
		     (not (pred_6 ?v8))))


   (:action op_1
       :parameters (?v7 ?v3)
       :precondition  (and  (pred_4 ?v7) (pred_3 ?v3)
			    (pred_1 ?v7 ?v3) (pred_6 ?v3) (pred_2))
       :effect (and (pred_5 ?v7)
		    (not (pred_1 ?v7 ?v3)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v7  ?v3)
       :precondition  (and  (pred_4 ?v7) (pred_3 ?v3)
			    (pred_5 ?v7) (pred_6 ?v3))
       :effect (and (pred_1 ?v7 ?v3)
		    (pred_2)
		    (not (pred_5 ?v7)))))
