(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v2)
		(pred_1 ?v7)
		(pred_3 ?v3)
		(pred_6 ?v3)
		(pred_5 ?v7 ?v3)
		(pred_4)
		(pred_2 ?v7))

   (:action op_1
       :parameters  (?v5 ?v8)
       :precondition (and (not-eq ?v5 ?v8) 
                          (pred_3 ?v5) (pred_3 ?v8) (pred_6 ?v5))
       :effect (and  (pred_6 ?v8)
		     (not (pred_6 ?v5))))


   (:action op_2
       :parameters (?v4 ?v1)
       :precondition  (and  (pred_1 ?v4) (pred_3 ?v1)
			    (pred_5 ?v4 ?v1) (pred_6 ?v1) (pred_4))
       :effect (and (pred_2 ?v4)
		    (not (pred_5 ?v4 ?v1)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v4  ?v1)
       :precondition  (and  (pred_1 ?v4) (pred_3 ?v1)
			    (pred_2 ?v4) (pred_6 ?v1))
       :effect (and (pred_5 ?v4 ?v1)
		    (pred_4)
		    (not (pred_2 ?v4)))))
