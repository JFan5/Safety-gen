(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v4)
		(pred_5 ?v5)
		(pred_2 ?v8)
		(pred_4 ?v8)
		(pred_1 ?v5 ?v8)
		(pred_6)
		(pred_3 ?v5))

   (:action op_1
       :parameters  (?v3 ?v6)
       :precondition (and (not-eq ?v3 ?v6) 
                          (pred_2 ?v3) (pred_2 ?v6) (pred_4 ?v3))
       :effect (and  (pred_4 ?v6)
		     (not (pred_4 ?v3))))


   (:action op_2
       :parameters (?v1 ?v2)
       :precondition  (and  (pred_5 ?v1) (pred_2 ?v2)
			    (pred_1 ?v1 ?v2) (pred_4 ?v2) (pred_6))
       :effect (and (pred_3 ?v1)
		    (not (pred_1 ?v1 ?v2)) 
		    (not (pred_6))))

   (:action op_3
       :parameters  (?v1  ?v2)
       :precondition  (and  (pred_5 ?v1) (pred_2 ?v2)
			    (pred_3 ?v1) (pred_4 ?v2))
       :effect (and (pred_1 ?v1 ?v2)
		    (pred_6)
		    (not (pred_3 ?v1)))))
