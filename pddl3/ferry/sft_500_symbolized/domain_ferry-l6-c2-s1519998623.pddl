(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v3)
		(pred_2 ?v4)
		(pred_6 ?v8)
		(pred_5 ?v8)
		(pred_1 ?v4 ?v8)
		(pred_3)
		(pred_4 ?v4))

   (:action op_2
       :parameters  (?v7 ?v2)
       :precondition (and (not-eq ?v7 ?v2) 
                          (pred_6 ?v7) (pred_6 ?v2) (pred_5 ?v7))
       :effect (and  (pred_5 ?v2)
		     (not (pred_5 ?v7))))


   (:action op_3
       :parameters (?v5 ?v1)
       :precondition  (and  (pred_2 ?v5) (pred_6 ?v1)
			    (pred_1 ?v5 ?v1) (pred_5 ?v1) (pred_3))
       :effect (and (pred_4 ?v5)
		    (not (pred_1 ?v5 ?v1)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v5  ?v1)
       :precondition  (and  (pred_2 ?v5) (pred_6 ?v1)
			    (pred_4 ?v5) (pred_5 ?v1))
       :effect (and (pred_1 ?v5 ?v1)
		    (pred_3)
		    (not (pred_4 ?v5)))))
