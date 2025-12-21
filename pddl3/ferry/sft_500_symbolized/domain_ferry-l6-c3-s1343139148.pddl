(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v6)
		(pred_5 ?v3)
		(pred_4 ?v8)
		(pred_2 ?v8)
		(pred_1 ?v3 ?v8)
		(pred_3)
		(pred_6 ?v3))

   (:action op_2
       :parameters  (?v4 ?v7)
       :precondition (and (not-eq ?v4 ?v7) 
                          (pred_4 ?v4) (pred_4 ?v7) (pred_2 ?v4))
       :effect (and  (pred_2 ?v7)
		     (not (pred_2 ?v4))))


   (:action op_3
       :parameters (?v2 ?v1)
       :precondition  (and  (pred_5 ?v2) (pred_4 ?v1)
			    (pred_1 ?v2 ?v1) (pred_2 ?v1) (pred_3))
       :effect (and (pred_6 ?v2)
		    (not (pred_1 ?v2 ?v1)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v2  ?v1)
       :precondition  (and  (pred_5 ?v2) (pred_4 ?v1)
			    (pred_6 ?v2) (pred_2 ?v1))
       :effect (and (pred_1 ?v2 ?v1)
		    (pred_3)
		    (not (pred_6 ?v2)))))
