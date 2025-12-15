(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v4)
		(pred_2 ?v7)
		(pred_3 ?v5)
		(pred_1 ?v5)
		(pred_4 ?v7 ?v5)
		(pred_6)
		(pred_5 ?v7))

   (:action op_3
       :parameters  (?v1 ?v8)
       :precondition (and (not-eq ?v1 ?v8) 
                          (pred_3 ?v1) (pred_3 ?v8) (pred_1 ?v1))
       :effect (and  (pred_1 ?v8)
		     (not (pred_1 ?v1))))


   (:action op_2
       :parameters (?v6 ?v2)
       :precondition  (and  (pred_2 ?v6) (pred_3 ?v2)
			    (pred_4 ?v6 ?v2) (pred_1 ?v2) (pred_6))
       :effect (and (pred_5 ?v6)
		    (not (pred_4 ?v6 ?v2)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v6  ?v2)
       :precondition  (and  (pred_2 ?v6) (pred_3 ?v2)
			    (pred_5 ?v6) (pred_1 ?v2))
       :effect (and (pred_4 ?v6 ?v2)
		    (pred_6)
		    (not (pred_5 ?v6)))))
