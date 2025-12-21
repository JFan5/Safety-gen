(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v5)
		(pred_1 ?v2)
		(pred_5 ?v6)
		(pred_4 ?v6)
		(pred_2 ?v2 ?v6)
		(pred_3)
		(pred_6 ?v2))

   (:action op_1
       :parameters  (?v8 ?v1)
       :precondition (and (not-eq ?v8 ?v1) 
                          (pred_5 ?v8) (pred_5 ?v1) (pred_4 ?v8))
       :effect (and  (pred_4 ?v1)
		     (not (pred_4 ?v8))))


   (:action op_3
       :parameters (?v7 ?v3)
       :precondition  (and  (pred_1 ?v7) (pred_5 ?v3)
			    (pred_2 ?v7 ?v3) (pred_4 ?v3) (pred_3))
       :effect (and (pred_6 ?v7)
		    (not (pred_2 ?v7 ?v3)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v7  ?v3)
       :precondition  (and  (pred_1 ?v7) (pred_5 ?v3)
			    (pred_6 ?v7) (pred_4 ?v3))
       :effect (and (pred_2 ?v7 ?v3)
		    (pred_3)
		    (not (pred_6 ?v7)))))
