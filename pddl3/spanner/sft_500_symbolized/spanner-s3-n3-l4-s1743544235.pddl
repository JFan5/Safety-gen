; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1743544235 --problem-name spanner-s3-n3-l4-s1743544235
(define (problem spanner-s3-n3-l4-s1743544235)
 (:domain spanner)
 (:objects 
     obj_13 - type_3
     obj_10 obj_12 obj_06 - type_2
     obj_11 obj_04 obj_05 - type_5
     obj_09 obj_03 obj_08 obj_01 - type_1
     obj_07 obj_02 - type_1
    )
 (:init 
    (pred_5 obj_13 obj_07)
    (pred_5 obj_10 obj_03)
    (pred_1 obj_10)
    (pred_5 obj_12 obj_01)
    (pred_1 obj_12)
    (pred_5 obj_06 obj_03)
    (pred_1 obj_06)
    (pred_3 obj_11)
    (pred_5 obj_11 obj_02)
    (pred_3 obj_04)
    (pred_5 obj_04 obj_02)
    (pred_3 obj_05)
    (pred_5 obj_05 obj_02)
    (pred_2 obj_07 obj_09)
    (pred_2 obj_01 obj_02)
    (pred_2 obj_09 obj_03)
    (pred_2 obj_03 obj_08)
    (pred_2 obj_08 obj_01)
)
 (:goal
  (and
   (pred_4 obj_11)
   (pred_4 obj_04)
   (pred_4 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_11)) (not (pred_4 obj_04))))
    (forall (?m - type_3) (at-most-once (pred_5 ?m obj_07)))
  )
)
)
