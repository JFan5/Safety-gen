(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v3)
		(pred_2 ?v4)
		(pred_1 ?v2)
		(pred_5 ?v2)
		(pred_4 ?v4 ?v2)
		(pred_6)
		(pred_3 ?v4))

   (:action op_2
       :parameters  (?v6 ?v8)
       :precondition (and (not-eq ?v6 ?v8) 
                          (pred_1 ?v6) (pred_1 ?v8) (pred_5 ?v6))
       :effect (and  (pred_5 ?v8)
		     (not (pred_5 ?v6))))


   (:action op_1
       :parameters (?v1 ?v5)
       :precondition  (and  (pred_2 ?v1) (pred_1 ?v5)
			    (pred_4 ?v1 ?v5) (pred_5 ?v5) (pred_6))
       :effect (and (pred_3 ?v1)
		    (not (pred_4 ?v1 ?v5)) 
		    (not (pred_6))))

   (:action op_3
       :parameters  (?v1  ?v5)
       :precondition  (and  (pred_2 ?v1) (pred_1 ?v5)
			    (pred_3 ?v1) (pred_5 ?v5))
       :effect (and (pred_4 ?v1 ?v5)
		    (pred_6)
		    (not (pred_3 ?v1)))))
