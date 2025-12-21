(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v7)
		(pred_4 ?v6)
		(pred_5 ?v8)
		(pred_1 ?v8)
		(pred_2 ?v6 ?v8)
		(pred_6)
		(pred_3 ?v6))

   (:action op_3
       :parameters  (?v3 ?v5)
       :precondition (and (not-eq ?v3 ?v5) 
                          (pred_5 ?v3) (pred_5 ?v5) (pred_1 ?v3))
       :effect (and  (pred_1 ?v5)
		     (not (pred_1 ?v3))))


   (:action op_1
       :parameters (?v1 ?v4)
       :precondition  (and  (pred_4 ?v1) (pred_5 ?v4)
			    (pred_2 ?v1 ?v4) (pred_1 ?v4) (pred_6))
       :effect (and (pred_3 ?v1)
		    (not (pred_2 ?v1 ?v4)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v1  ?v4)
       :precondition  (and  (pred_4 ?v1) (pred_5 ?v4)
			    (pred_3 ?v1) (pred_1 ?v4))
       :effect (and (pred_2 ?v1 ?v4)
		    (pred_6)
		    (not (pred_3 ?v1)))))
