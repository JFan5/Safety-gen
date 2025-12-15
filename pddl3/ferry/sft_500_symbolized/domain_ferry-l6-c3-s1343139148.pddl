(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v7)
		(pred_6 ?v4)
		(pred_2 ?v2)
		(pred_5 ?v2)
		(pred_1 ?v4 ?v2)
		(pred_4)
		(pred_3 ?v4))

   (:action op_3
       :parameters  (?v8 ?v1)
       :precondition (and (not-eq ?v8 ?v1) 
                          (pred_2 ?v8) (pred_2 ?v1) (pred_5 ?v8))
       :effect (and  (pred_5 ?v1)
		     (not (pred_5 ?v8))))


   (:action op_1
       :parameters (?v3 ?v5)
       :precondition  (and  (pred_6 ?v3) (pred_2 ?v5)
			    (pred_1 ?v3 ?v5) (pred_5 ?v5) (pred_4))
       :effect (and (pred_3 ?v3)
		    (not (pred_1 ?v3 ?v5)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v3  ?v5)
       :precondition  (and  (pred_6 ?v3) (pred_2 ?v5)
			    (pred_3 ?v3) (pred_5 ?v5))
       :effect (and (pred_1 ?v3 ?v5)
		    (pred_4)
		    (not (pred_3 ?v3)))))
