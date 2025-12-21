(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v3)
		(pred_4 ?v8)
		(pred_2 ?v5)
		(pred_5 ?v5)
		(pred_3 ?v8 ?v5)
		(pred_6)
		(pred_1 ?v8))

   (:action op_1
       :parameters  (?v7 ?v4)
       :precondition (and (not-eq ?v7 ?v4) 
                          (pred_2 ?v7) (pred_2 ?v4) (pred_5 ?v7))
       :effect (and  (pred_5 ?v4)
		     (not (pred_5 ?v7))))


   (:action op_3
       :parameters (?v2 ?v6)
       :precondition  (and  (pred_4 ?v2) (pred_2 ?v6)
			    (pred_3 ?v2 ?v6) (pred_5 ?v6) (pred_6))
       :effect (and (pred_1 ?v2)
		    (not (pred_3 ?v2 ?v6)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v2  ?v6)
       :precondition  (and  (pred_4 ?v2) (pred_2 ?v6)
			    (pred_1 ?v2) (pred_5 ?v6))
       :effect (and (pred_3 ?v2 ?v6)
		    (pred_6)
		    (not (pred_1 ?v2)))))
