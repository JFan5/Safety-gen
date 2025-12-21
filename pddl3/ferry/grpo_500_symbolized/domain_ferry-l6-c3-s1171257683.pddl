(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v1)
		(pred_5 ?v7)
		(pred_4 ?v3)
		(pred_3 ?v3)
		(pred_1 ?v7 ?v3)
		(pred_6)
		(pred_2 ?v7))

   (:action op_1
       :parameters  (?v5 ?v4)
       :precondition (and (not-eq ?v5 ?v4) 
                          (pred_4 ?v5) (pred_4 ?v4) (pred_3 ?v5))
       :effect (and  (pred_3 ?v4)
		     (not (pred_3 ?v5))))


   (:action op_2
       :parameters (?v2 ?v6)
       :precondition  (and  (pred_5 ?v2) (pred_4 ?v6)
			    (pred_1 ?v2 ?v6) (pred_3 ?v6) (pred_6))
       :effect (and (pred_2 ?v2)
		    (not (pred_1 ?v2 ?v6)) 
		    (not (pred_6))))

   (:action op_3
       :parameters  (?v2  ?v6)
       :precondition  (and  (pred_5 ?v2) (pred_4 ?v6)
			    (pred_2 ?v2) (pred_3 ?v6))
       :effect (and (pred_1 ?v2 ?v6)
		    (pred_6)
		    (not (pred_2 ?v2)))))
