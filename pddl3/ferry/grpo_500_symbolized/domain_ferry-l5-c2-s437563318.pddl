(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v6)
		(pred_3 ?v3)
		(pred_2 ?v5)
		(pred_5 ?v5)
		(pred_4 ?v3 ?v5)
		(pred_6)
		(pred_1 ?v3))

   (:action op_2
       :parameters  (?v7 ?v2)
       :precondition (and (not-eq ?v7 ?v2) 
                          (pred_2 ?v7) (pred_2 ?v2) (pred_5 ?v7))
       :effect (and  (pred_5 ?v2)
		     (not (pred_5 ?v7))))


   (:action op_3
       :parameters (?v4 ?v1)
       :precondition  (and  (pred_3 ?v4) (pred_2 ?v1)
			    (pred_4 ?v4 ?v1) (pred_5 ?v1) (pred_6))
       :effect (and (pred_1 ?v4)
		    (not (pred_4 ?v4 ?v1)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v4  ?v1)
       :precondition  (and  (pred_3 ?v4) (pred_2 ?v1)
			    (pred_1 ?v4) (pred_5 ?v1))
       :effect (and (pred_4 ?v4 ?v1)
		    (pred_6)
		    (not (pred_1 ?v4)))))
