(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v2)
		(pred_4 ?v3)
		(pred_2 ?v8)
		(pred_3 ?v8)
		(pred_1 ?v3 ?v8)
		(pred_5)
		(pred_6 ?v3))

   (:action op_2
       :parameters  (?v6 ?v5)
       :precondition (and (not-eq ?v6 ?v5) 
                          (pred_2 ?v6) (pred_2 ?v5) (pred_3 ?v6))
       :effect (and  (pred_3 ?v5)
		     (not (pred_3 ?v6))))


   (:action op_3
       :parameters (?v4 ?v1)
       :precondition  (and  (pred_4 ?v4) (pred_2 ?v1)
			    (pred_1 ?v4 ?v1) (pred_3 ?v1) (pred_5))
       :effect (and (pred_6 ?v4)
		    (not (pred_1 ?v4 ?v1)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v4  ?v1)
       :precondition  (and  (pred_4 ?v4) (pred_2 ?v1)
			    (pred_6 ?v4) (pred_3 ?v1))
       :effect (and (pred_1 ?v4 ?v1)
		    (pred_5)
		    (not (pred_6 ?v4)))))
