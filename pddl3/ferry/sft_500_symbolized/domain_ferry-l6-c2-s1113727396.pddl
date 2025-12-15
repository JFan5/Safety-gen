(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v7)
		(pred_1 ?v8)
		(pred_2 ?v3)
		(pred_4 ?v3)
		(pred_6 ?v8 ?v3)
		(pred_3)
		(pred_5 ?v8))

   (:action op_3
       :parameters  (?v6 ?v4)
       :precondition (and (not-eq ?v6 ?v4) 
                          (pred_2 ?v6) (pred_2 ?v4) (pred_4 ?v6))
       :effect (and  (pred_4 ?v4)
		     (not (pred_4 ?v6))))


   (:action op_1
       :parameters (?v1 ?v2)
       :precondition  (and  (pred_1 ?v1) (pred_2 ?v2)
			    (pred_6 ?v1 ?v2) (pred_4 ?v2) (pred_3))
       :effect (and (pred_5 ?v1)
		    (not (pred_6 ?v1 ?v2)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v1  ?v2)
       :precondition  (and  (pred_1 ?v1) (pred_2 ?v2)
			    (pred_5 ?v1) (pred_4 ?v2))
       :effect (and (pred_6 ?v1 ?v2)
		    (pred_3)
		    (not (pred_5 ?v1)))))
