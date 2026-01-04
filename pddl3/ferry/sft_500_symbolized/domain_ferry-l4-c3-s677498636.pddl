(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v7)
		(pred_2 ?v5)
		(pred_5 ?v4)
		(pred_6 ?v4)
		(pred_4 ?v5 ?v4)
		(pred_1)
		(pred_3 ?v5))

   (:action op_3
       :parameters  (?v6 ?v8)
       :precondition (and (not-eq ?v6 ?v8) 
                          (pred_5 ?v6) (pred_5 ?v8) (pred_6 ?v6))
       :effect (and  (pred_6 ?v8)
		     (not (pred_6 ?v6))))


   (:action op_1
       :parameters (?v3 ?v1)
       :precondition  (and  (pred_2 ?v3) (pred_5 ?v1)
			    (pred_4 ?v3 ?v1) (pred_6 ?v1) (pred_1))
       :effect (and (pred_3 ?v3)
		    (not (pred_4 ?v3 ?v1)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v3  ?v1)
       :precondition  (and  (pred_2 ?v3) (pred_5 ?v1)
			    (pred_3 ?v3) (pred_6 ?v1))
       :effect (and (pred_4 ?v3 ?v1)
		    (pred_1)
		    (not (pred_3 ?v3)))))
