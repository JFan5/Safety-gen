(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v8)
		(pred_2 ?v3)
		(pred_4 ?v5)
		(pred_1 ?v5)
		(pred_5 ?v3 ?v5)
		(pred_6)
		(pred_3 ?v3))

   (:action op_2
       :parameters  (?v6 ?v4)
       :precondition (and (not-eq ?v6 ?v4) 
                          (pred_4 ?v6) (pred_4 ?v4) (pred_1 ?v6))
       :effect (and  (pred_1 ?v4)
		     (not (pred_1 ?v6))))


   (:action op_3
       :parameters (?v2 ?v1)
       :precondition  (and  (pred_2 ?v2) (pred_4 ?v1)
			    (pred_5 ?v2 ?v1) (pred_1 ?v1) (pred_6))
       :effect (and (pred_3 ?v2)
		    (not (pred_5 ?v2 ?v1)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v2  ?v1)
       :precondition  (and  (pred_2 ?v2) (pred_4 ?v1)
			    (pred_3 ?v2) (pred_1 ?v1))
       :effect (and (pred_5 ?v2 ?v1)
		    (pred_6)
		    (not (pred_3 ?v2)))))
