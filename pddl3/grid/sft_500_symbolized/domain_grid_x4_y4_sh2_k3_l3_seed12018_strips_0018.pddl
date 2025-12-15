(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v6 ?v5)
             (pred_12 ?v12 ?v1)
             (pred_9 ?v6 ?v1)
             (pred_10 ?v2 ?v6 )
	     (pred_3 ?v6)
             (pred_8 ?v10)
             (pred_6 ?v12)
             (pred_1 ?v1)
             (pred_4 ?v6)
             (pred_5 ?v12)
             (pred_2 ?v6)
             (pred_7 ))



(:action op_3
:parameters (?v3 ?v11 ?v13 ?v9)
:precondition (and (pred_8 ?v3) (pred_8 ?v11) (pred_6 ?v13) (pred_1 ?v9)
          (pred_11 ?v3 ?v11) (pred_12 ?v13 ?v9)
                   (pred_9 ?v11 ?v9) (pred_3 ?v3) 
                   (pred_4 ?v11) (pred_5 ?v13))
:effect (and  (pred_2 ?v11) (not (pred_4 ?v11))))


(:action op_5
:parameters (?v3 ?v4)
:precondition (and (pred_8 ?v3) (pred_8 ?v4)
               (pred_3 ?v3) (pred_11 ?v3 ?v4) (pred_2 ?v4))
:effect (and (pred_3 ?v4) (not (pred_3 ?v3))))

(:action op_2
:parameters (?v3 ?v13)
:precondition (and (pred_8 ?v3) (pred_6 ?v13) 
                  (pred_3 ?v3) (pred_10 ?v13 ?v3) (pred_7 ))
:effect (and (pred_5 ?v13)
   (not (pred_10 ?v13 ?v3)) (not (pred_7 ))))


(:action op_1
:parameters (?v3 ?v8 ?v7)
:precondition (and (pred_8 ?v3) (pred_6 ?v8) (pred_6 ?v7)
                  (pred_3 ?v3) (pred_5 ?v7) (pred_10 ?v8 ?v3))
:effect (and (pred_5 ?v8) (pred_10 ?v7 ?v3)
        (not (pred_5 ?v7)) (not (pred_10 ?v8 ?v3))))

(:action op_4
:parameters (?v3 ?v13)
:precondition (and (pred_8 ?v3) (pred_6 ?v13) 
                  (pred_3 ?v3) (pred_5 ?v13))
:effect (and (pred_7 ) (pred_10 ?v13 ?v3) (not (pred_5 ?v13)))))


	
