(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v3)
		(pred_3 ?v4)
		(pred_5 ?v8)
		(pred_2 ?v8)
		(pred_4 ?v4 ?v8)
		(pred_6)
		(pred_1 ?v4))

   (:action op_3
       :parameters  (?v1 ?v2)
       :precondition (and (not-eq ?v1 ?v2) 
                          (pred_5 ?v1) (pred_5 ?v2) (pred_2 ?v1))
       :effect (and  (pred_2 ?v2)
		     (not (pred_2 ?v1))))


   (:action op_1
       :parameters (?v5 ?v6)
       :precondition  (and  (pred_3 ?v5) (pred_5 ?v6)
			    (pred_4 ?v5 ?v6) (pred_2 ?v6) (pred_6))
       :effect (and (pred_1 ?v5)
		    (not (pred_4 ?v5 ?v6)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v5  ?v6)
       :precondition  (and  (pred_3 ?v5) (pred_5 ?v6)
			    (pred_1 ?v5) (pred_2 ?v6))
       :effect (and (pred_4 ?v5 ?v6)
		    (pred_6)
		    (not (pred_1 ?v5)))))
