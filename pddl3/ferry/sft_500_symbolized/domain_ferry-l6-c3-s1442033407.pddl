(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v4)
		(pred_6 ?v8)
		(pred_4 ?v7)
		(pred_5 ?v7)
		(pred_2 ?v8 ?v7)
		(pred_3)
		(pred_1 ?v8))

   (:action op_1
       :parameters  (?v5 ?v1)
       :precondition (and (not-eq ?v5 ?v1) 
                          (pred_4 ?v5) (pred_4 ?v1) (pred_5 ?v5))
       :effect (and  (pred_5 ?v1)
		     (not (pred_5 ?v5))))


   (:action op_2
       :parameters (?v3 ?v2)
       :precondition  (and  (pred_6 ?v3) (pred_4 ?v2)
			    (pred_2 ?v3 ?v2) (pred_5 ?v2) (pred_3))
       :effect (and (pred_1 ?v3)
		    (not (pred_2 ?v3 ?v2)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v3  ?v2)
       :precondition  (and  (pred_6 ?v3) (pred_4 ?v2)
			    (pred_1 ?v3) (pred_5 ?v2))
       :effect (and (pred_2 ?v3 ?v2)
		    (pred_3)
		    (not (pred_1 ?v3)))))
