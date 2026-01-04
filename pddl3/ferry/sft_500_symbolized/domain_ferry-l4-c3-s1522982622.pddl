(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v4)
		(pred_4 ?v7)
		(pred_1 ?v8)
		(pred_5 ?v8)
		(pred_3 ?v7 ?v8)
		(pred_6)
		(pred_2 ?v7))

   (:action op_3
       :parameters  (?v5 ?v2)
       :precondition (and (not-eq ?v5 ?v2) 
                          (pred_1 ?v5) (pred_1 ?v2) (pred_5 ?v5))
       :effect (and  (pred_5 ?v2)
		     (not (pred_5 ?v5))))


   (:action op_1
       :parameters (?v1 ?v6)
       :precondition  (and  (pred_4 ?v1) (pred_1 ?v6)
			    (pred_3 ?v1 ?v6) (pred_5 ?v6) (pred_6))
       :effect (and (pred_2 ?v1)
		    (not (pred_3 ?v1 ?v6)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v1  ?v6)
       :precondition  (and  (pred_4 ?v1) (pred_1 ?v6)
			    (pred_2 ?v1) (pred_5 ?v6))
       :effect (and (pred_3 ?v1 ?v6)
		    (pred_6)
		    (not (pred_2 ?v1)))))
