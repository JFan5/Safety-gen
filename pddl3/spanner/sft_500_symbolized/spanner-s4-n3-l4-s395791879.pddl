; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 395791879 --problem-name spanner-s4-n3-l4-s395791879
(define (problem spanner-s4-n3-l4-s395791879)
 (:domain spanner)
 (:objects 
     obj_07 - type_5
     obj_13 obj_08 obj_05 obj_02 - type_1
     obj_12 obj_10 obj_01 - type_3
     obj_04 obj_11 obj_09 obj_14 - type_2
     obj_06 obj_03 - type_2
    )
 (:init 
    (pred_5 obj_07 obj_06)
    (pred_5 obj_13 obj_04)
    (pred_2 obj_13)
    (pred_5 obj_08 obj_04)
    (pred_2 obj_08)
    (pred_5 obj_05 obj_14)
    (pred_2 obj_05)
    (pred_5 obj_02 obj_09)
    (pred_2 obj_02)
    (pred_3 obj_12)
    (pred_5 obj_12 obj_03)
    (pred_3 obj_10)
    (pred_5 obj_10 obj_03)
    (pred_3 obj_01)
    (pred_5 obj_01 obj_03)
    (pred_6 obj_06 obj_04)
    (pred_6 obj_14 obj_03)
    (pred_6 obj_04 obj_11)
    (pred_6 obj_11 obj_09)
    (pred_6 obj_09 obj_14)
)
 (:goal
  (and
   (pred_4 obj_12)
   (pred_4 obj_10)
   (pred_4 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_12)) (not (pred_4 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_06)))
  )
)
)
