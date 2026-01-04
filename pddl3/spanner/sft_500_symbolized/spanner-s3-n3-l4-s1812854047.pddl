; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1812854047 --problem-name spanner-s3-n3-l4-s1812854047
(define (problem spanner-s3-n3-l4-s1812854047)
 (:domain spanner)
 (:objects 
     obj_13 - type_3
     obj_08 obj_12 obj_05 - type_1
     obj_03 obj_04 obj_11 - type_4
     obj_02 obj_01 obj_06 obj_09 - type_2
     obj_07 obj_10 - type_2
    )
 (:init 
    (pred_3 obj_13 obj_07)
    (pred_3 obj_08 obj_06)
    (pred_1 obj_08)
    (pred_3 obj_12 obj_02)
    (pred_1 obj_12)
    (pred_3 obj_05 obj_02)
    (pred_1 obj_05)
    (pred_6 obj_03)
    (pred_3 obj_03 obj_10)
    (pred_6 obj_04)
    (pred_3 obj_04 obj_10)
    (pred_6 obj_11)
    (pred_3 obj_11 obj_10)
    (pred_5 obj_07 obj_02)
    (pred_5 obj_09 obj_10)
    (pred_5 obj_02 obj_01)
    (pred_5 obj_01 obj_06)
    (pred_5 obj_06 obj_09)
)
 (:goal
  (and
   (pred_4 obj_03)
   (pred_4 obj_04)
   (pred_4 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_04)) (not (pred_4 obj_11))))
    (forall (?m - type_3) (at-most-once (pred_3 ?m obj_07)))
  )
)
)
