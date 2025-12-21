(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v7)
		(pred_3 ?v3)
		(pred_4 ?v2)
		(pred_1 ?v2)
		(pred_6 ?v3 ?v2)
		(pred_5)
		(pred_2 ?v3))

   (:action op_1
       :parameters  (?v1 ?v8)
       :precondition (and (not-eq ?v1 ?v8) 
                          (pred_4 ?v1) (pred_4 ?v8) (pred_1 ?v1))
       :effect (and  (pred_1 ?v8)
		     (not (pred_1 ?v1))))


   (:action op_3
       :parameters (?v5 ?v6)
       :precondition  (and  (pred_3 ?v5) (pred_4 ?v6)
			    (pred_6 ?v5 ?v6) (pred_1 ?v6) (pred_5))
       :effect (and (pred_2 ?v5)
		    (not (pred_6 ?v5 ?v6)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v5  ?v6)
       :precondition  (and  (pred_3 ?v5) (pred_4 ?v6)
			    (pred_2 ?v5) (pred_1 ?v6))
       :effect (and (pred_6 ?v5 ?v6)
		    (pred_5)
		    (not (pred_2 ?v5)))))
