(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v4)
		(pred_6 ?v2)
		(pred_4 ?v6)
		(pred_3 ?v6)
		(pred_1 ?v2 ?v6)
		(pred_2)
		(pred_5 ?v2))

   (:action op_1
       :parameters  (?v8 ?v1)
       :precondition (and (not-eq ?v8 ?v1) 
                          (pred_4 ?v8) (pred_4 ?v1) (pred_3 ?v8))
       :effect (and  (pred_3 ?v1)
		     (not (pred_3 ?v8))))


   (:action op_2
       :parameters (?v3 ?v7)
       :precondition  (and  (pred_6 ?v3) (pred_4 ?v7)
			    (pred_1 ?v3 ?v7) (pred_3 ?v7) (pred_2))
       :effect (and (pred_5 ?v3)
		    (not (pred_1 ?v3 ?v7)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v3  ?v7)
       :precondition  (and  (pred_6 ?v3) (pred_4 ?v7)
			    (pred_5 ?v3) (pred_3 ?v7))
       :effect (and (pred_1 ?v3 ?v7)
		    (pred_2)
		    (not (pred_5 ?v3)))))
