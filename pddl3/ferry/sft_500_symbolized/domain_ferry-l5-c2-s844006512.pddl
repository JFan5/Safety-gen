(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v2)
		(pred_2 ?v5)
		(pred_6 ?v7)
		(pred_3 ?v7)
		(pred_1 ?v5 ?v7)
		(pred_5)
		(pred_4 ?v5))

   (:action op_1
       :parameters  (?v6 ?v8)
       :precondition (and (not-eq ?v6 ?v8) 
                          (pred_6 ?v6) (pred_6 ?v8) (pred_3 ?v6))
       :effect (and  (pred_3 ?v8)
		     (not (pred_3 ?v6))))


   (:action op_3
       :parameters (?v3 ?v4)
       :precondition  (and  (pred_2 ?v3) (pred_6 ?v4)
			    (pred_1 ?v3 ?v4) (pred_3 ?v4) (pred_5))
       :effect (and (pred_4 ?v3)
		    (not (pred_1 ?v3 ?v4)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v3  ?v4)
       :precondition  (and  (pred_2 ?v3) (pred_6 ?v4)
			    (pred_4 ?v3) (pred_3 ?v4))
       :effect (and (pred_1 ?v3 ?v4)
		    (pred_5)
		    (not (pred_4 ?v3)))))
