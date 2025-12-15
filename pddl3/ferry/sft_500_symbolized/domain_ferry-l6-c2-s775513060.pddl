(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v3)
		(pred_1 ?v4)
		(pred_5 ?v7)
		(pred_3 ?v7)
		(pred_4 ?v4 ?v7)
		(pred_6)
		(pred_2 ?v4))

   (:action op_2
       :parameters  (?v5 ?v2)
       :precondition (and (not-eq ?v5 ?v2) 
                          (pred_5 ?v5) (pred_5 ?v2) (pred_3 ?v5))
       :effect (and  (pred_3 ?v2)
		     (not (pred_3 ?v5))))


   (:action op_3
       :parameters (?v1 ?v6)
       :precondition  (and  (pred_1 ?v1) (pred_5 ?v6)
			    (pred_4 ?v1 ?v6) (pred_3 ?v6) (pred_6))
       :effect (and (pred_2 ?v1)
		    (not (pred_4 ?v1 ?v6)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v1  ?v6)
       :precondition  (and  (pred_1 ?v1) (pred_5 ?v6)
			    (pred_2 ?v1) (pred_3 ?v6))
       :effect (and (pred_4 ?v1 ?v6)
		    (pred_6)
		    (not (pred_2 ?v1)))))
