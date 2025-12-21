(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v8)
		(pred_6 ?v1)
		(pred_4 ?v6)
		(pred_2 ?v6)
		(pred_5 ?v1 ?v6)
		(pred_3)
		(pred_1 ?v1))

   (:action op_3
       :parameters  (?v7 ?v5)
       :precondition (and (not-eq ?v7 ?v5) 
                          (pred_4 ?v7) (pred_4 ?v5) (pred_2 ?v7))
       :effect (and  (pred_2 ?v5)
		     (not (pred_2 ?v7))))


   (:action op_2
       :parameters (?v4 ?v2)
       :precondition  (and  (pred_6 ?v4) (pred_4 ?v2)
			    (pred_5 ?v4 ?v2) (pred_2 ?v2) (pred_3))
       :effect (and (pred_1 ?v4)
		    (not (pred_5 ?v4 ?v2)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v4  ?v2)
       :precondition  (and  (pred_6 ?v4) (pred_4 ?v2)
			    (pred_1 ?v4) (pred_2 ?v2))
       :effect (and (pred_5 ?v4 ?v2)
		    (pred_3)
		    (not (pred_1 ?v4)))))
