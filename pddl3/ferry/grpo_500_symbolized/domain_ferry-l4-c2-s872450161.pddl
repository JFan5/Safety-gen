(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v3)
		(pred_3 ?v5)
		(pred_4 ?v8)
		(pred_5 ?v8)
		(pred_1 ?v5 ?v8)
		(pred_6)
		(pred_2 ?v5))

   (:action op_1
       :parameters  (?v1 ?v4)
       :precondition (and (not-eq ?v1 ?v4) 
                          (pred_4 ?v1) (pred_4 ?v4) (pred_5 ?v1))
       :effect (and  (pred_5 ?v4)
		     (not (pred_5 ?v1))))


   (:action op_2
       :parameters (?v2 ?v6)
       :precondition  (and  (pred_3 ?v2) (pred_4 ?v6)
			    (pred_1 ?v2 ?v6) (pred_5 ?v6) (pred_6))
       :effect (and (pred_2 ?v2)
		    (not (pred_1 ?v2 ?v6)) 
		    (not (pred_6))))

   (:action op_3
       :parameters  (?v2  ?v6)
       :precondition  (and  (pred_3 ?v2) (pred_4 ?v6)
			    (pred_2 ?v2) (pred_5 ?v6))
       :effect (and (pred_1 ?v2 ?v6)
		    (pred_6)
		    (not (pred_2 ?v2)))))
