(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v7)
		(pred_4 ?v8)
		(pred_2 ?v1)
		(pred_1 ?v1)
		(pred_5 ?v8 ?v1)
		(pred_3)
		(pred_6 ?v8))

   (:action op_1
       :parameters  (?v6 ?v4)
       :precondition (and (not-eq ?v6 ?v4) 
                          (pred_2 ?v6) (pred_2 ?v4) (pred_1 ?v6))
       :effect (and  (pred_1 ?v4)
		     (not (pred_1 ?v6))))


   (:action op_3
       :parameters (?v2 ?v3)
       :precondition  (and  (pred_4 ?v2) (pred_2 ?v3)
			    (pred_5 ?v2 ?v3) (pred_1 ?v3) (pred_3))
       :effect (and (pred_6 ?v2)
		    (not (pred_5 ?v2 ?v3)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v2  ?v3)
       :precondition  (and  (pred_4 ?v2) (pred_2 ?v3)
			    (pred_6 ?v2) (pred_1 ?v3))
       :effect (and (pred_5 ?v2 ?v3)
		    (pred_3)
		    (not (pred_6 ?v2)))))
