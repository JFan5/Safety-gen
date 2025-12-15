(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v5)
		(pred_3 ?v1)
		(pred_5 ?v8)
		(pred_2 ?v8)
		(pred_4 ?v1 ?v8)
		(pred_6)
		(pred_1 ?v1))

   (:action op_2
       :parameters  (?v7 ?v3)
       :precondition (and (not-eq ?v7 ?v3) 
                          (pred_5 ?v7) (pred_5 ?v3) (pred_2 ?v7))
       :effect (and  (pred_2 ?v3)
		     (not (pred_2 ?v7))))


   (:action op_3
       :parameters (?v6 ?v4)
       :precondition  (and  (pred_3 ?v6) (pred_5 ?v4)
			    (pred_4 ?v6 ?v4) (pred_2 ?v4) (pred_6))
       :effect (and (pred_1 ?v6)
		    (not (pred_4 ?v6 ?v4)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v6  ?v4)
       :precondition  (and  (pred_3 ?v6) (pred_5 ?v4)
			    (pred_1 ?v6) (pred_2 ?v4))
       :effect (and (pred_4 ?v6 ?v4)
		    (pred_6)
		    (not (pred_1 ?v6)))))
