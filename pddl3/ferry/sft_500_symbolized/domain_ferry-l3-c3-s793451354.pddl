(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v7)
		(pred_4 ?v2)
		(pred_2 ?v3)
		(pred_5 ?v3)
		(pred_3 ?v2 ?v3)
		(pred_1)
		(pred_6 ?v2))

   (:action op_1
       :parameters  (?v6 ?v8)
       :precondition (and (not-eq ?v6 ?v8) 
                          (pred_2 ?v6) (pred_2 ?v8) (pred_5 ?v6))
       :effect (and  (pred_5 ?v8)
		     (not (pred_5 ?v6))))


   (:action op_3
       :parameters (?v4 ?v1)
       :precondition  (and  (pred_4 ?v4) (pred_2 ?v1)
			    (pred_3 ?v4 ?v1) (pred_5 ?v1) (pred_1))
       :effect (and (pred_6 ?v4)
		    (not (pred_3 ?v4 ?v1)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v4  ?v1)
       :precondition  (and  (pred_4 ?v4) (pred_2 ?v1)
			    (pred_6 ?v4) (pred_5 ?v1))
       :effect (and (pred_3 ?v4 ?v1)
		    (pred_1)
		    (not (pred_6 ?v4)))))
