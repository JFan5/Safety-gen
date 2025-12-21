(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v5)
		(pred_5 ?v6)
		(pred_1 ?v3)
		(pred_3 ?v3)
		(pred_2 ?v6 ?v3)
		(pred_6)
		(pred_4 ?v6))

   (:action op_1
       :parameters  (?v7 ?v1)
       :precondition (and (not-eq ?v7 ?v1) 
                          (pred_1 ?v7) (pred_1 ?v1) (pred_3 ?v7))
       :effect (and  (pred_3 ?v1)
		     (not (pred_3 ?v7))))


   (:action op_3
       :parameters (?v2 ?v4)
       :precondition  (and  (pred_5 ?v2) (pred_1 ?v4)
			    (pred_2 ?v2 ?v4) (pred_3 ?v4) (pred_6))
       :effect (and (pred_4 ?v2)
		    (not (pred_2 ?v2 ?v4)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v2  ?v4)
       :precondition  (and  (pred_5 ?v2) (pred_1 ?v4)
			    (pred_4 ?v2) (pred_3 ?v4))
       :effect (and (pred_2 ?v2 ?v4)
		    (pred_6)
		    (not (pred_4 ?v2)))))
