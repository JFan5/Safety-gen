; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1155128301 --problem-name spanner-s3-n3-l4-s1155128301
(define (problem spanner-s3-n3-l4-s1155128301)
 (:domain spanner)
 (:objects 
     obj_08 - type_2
     obj_02 obj_11 obj_09 - type_4
     obj_04 obj_12 obj_07 - type_1
     obj_10 obj_13 obj_06 obj_01 - type_3
     obj_03 obj_05 - type_3
    )
 (:init 
    (pred_1 obj_08 obj_03)
    (pred_1 obj_02 obj_06)
    (pred_3 obj_02)
    (pred_1 obj_11 obj_06)
    (pred_3 obj_11)
    (pred_1 obj_09 obj_06)
    (pred_3 obj_09)
    (pred_2 obj_04)
    (pred_1 obj_04 obj_05)
    (pred_2 obj_12)
    (pred_1 obj_12 obj_05)
    (pred_2 obj_07)
    (pred_1 obj_07 obj_05)
    (pred_4 obj_03 obj_10)
    (pred_4 obj_01 obj_05)
    (pred_4 obj_10 obj_13)
    (pred_4 obj_13 obj_06)
    (pred_4 obj_06 obj_01)
)
 (:goal
  (and
   (pred_5 obj_04)
   (pred_5 obj_12)
   (pred_5 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_12)) (not (pred_5 obj_07))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_03)))
  )
)
)
