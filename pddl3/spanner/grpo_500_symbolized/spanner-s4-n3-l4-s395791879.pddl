; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 395791879 --problem-name spanner-s4-n3-l4-s395791879
(define (problem spanner-s4-n3-l4-s395791879)
 (:domain spanner)
 (:objects 
     obj_03 - type_5
     obj_13 obj_04 obj_14 obj_07 - type_3
     obj_01 obj_12 obj_10 - type_1
     obj_05 obj_06 obj_09 obj_11 - type_2
     obj_02 obj_08 - type_2
    )
 (:init 
    (pred_6 obj_03 obj_02)
    (pred_6 obj_13 obj_05)
    (pred_5 obj_13)
    (pred_6 obj_04 obj_05)
    (pred_5 obj_04)
    (pred_6 obj_14 obj_11)
    (pred_5 obj_14)
    (pred_6 obj_07 obj_09)
    (pred_5 obj_07)
    (pred_4 obj_01)
    (pred_6 obj_01 obj_08)
    (pred_4 obj_12)
    (pred_6 obj_12 obj_08)
    (pred_4 obj_10)
    (pred_6 obj_10 obj_08)
    (pred_3 obj_02 obj_05)
    (pred_3 obj_11 obj_08)
    (pred_3 obj_05 obj_06)
    (pred_3 obj_06 obj_09)
    (pred_3 obj_09 obj_11)
)
 (:goal
  (and
   (pred_1 obj_01)
   (pred_1 obj_12)
   (pred_1 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_01)) (not (pred_1 obj_12))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_02)))
  )
)
)
