(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v4)
		(pred_5 ?v3)
		(pred_1 ?v1)
		(pred_2 ?v1)
		(pred_6 ?v3 ?v1)
		(pred_3)
		(pred_4 ?v3))

   (:action op_2
       :parameters  (?v6 ?v5)
       :precondition (and (not-eq ?v6 ?v5) 
                          (pred_1 ?v6) (pred_1 ?v5) (pred_2 ?v6))
       :effect (and  (pred_2 ?v5)
		     (not (pred_2 ?v6))))


   (:action op_1
       :parameters (?v8 ?v2)
       :precondition  (and  (pred_5 ?v8) (pred_1 ?v2)
			    (pred_6 ?v8 ?v2) (pred_2 ?v2) (pred_3))
       :effect (and (pred_4 ?v8)
		    (not (pred_6 ?v8 ?v2)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v8  ?v2)
       :precondition  (and  (pred_5 ?v8) (pred_1 ?v2)
			    (pred_4 ?v8) (pred_2 ?v2))
       :effect (and (pred_6 ?v8 ?v2)
		    (pred_3)
		    (not (pred_4 ?v8)))))
