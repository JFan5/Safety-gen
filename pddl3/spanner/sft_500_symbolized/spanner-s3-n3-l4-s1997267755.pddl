; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1997267755 --problem-name spanner-s3-n3-l4-s1997267755
(define (problem spanner-s3-n3-l4-s1997267755)
 (:domain spanner)
 (:objects 
     obj_05 - type_5
     obj_06 obj_13 obj_02 - type_4
     obj_08 obj_07 obj_04 - type_2
     obj_10 obj_01 obj_11 obj_12 - type_3
     obj_09 obj_03 - type_3
    )
 (:init 
    (pred_5 obj_05 obj_09)
    (pred_5 obj_06 obj_11)
    (pred_6 obj_06)
    (pred_5 obj_13 obj_10)
    (pred_6 obj_13)
    (pred_5 obj_02 obj_11)
    (pred_6 obj_02)
    (pred_4 obj_08)
    (pred_5 obj_08 obj_03)
    (pred_4 obj_07)
    (pred_5 obj_07 obj_03)
    (pred_4 obj_04)
    (pred_5 obj_04 obj_03)
    (pred_2 obj_09 obj_10)
    (pred_2 obj_12 obj_03)
    (pred_2 obj_10 obj_01)
    (pred_2 obj_01 obj_11)
    (pred_2 obj_11 obj_12)
)
 (:goal
  (and
   (pred_1 obj_08)
   (pred_1 obj_07)
   (pred_1 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_07)) (not (pred_1 obj_04))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_09)))
  )
)
)
