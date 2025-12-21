; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 595016557 --problem-name spanner-s4-n3-l4-s595016557
(define (problem spanner-s4-n3-l4-s595016557)
 (:domain spanner)
 (:objects 
     obj_06 - type_5
     obj_12 obj_10 obj_03 obj_09 - type_3
     obj_07 obj_13 obj_11 - type_1
     obj_05 obj_08 obj_01 obj_04 - type_2
     obj_02 obj_14 - type_2
    )
 (:init 
    (pred_6 obj_06 obj_02)
    (pred_6 obj_12 obj_04)
    (pred_5 obj_12)
    (pred_6 obj_10 obj_04)
    (pred_5 obj_10)
    (pred_6 obj_03 obj_04)
    (pred_5 obj_03)
    (pred_6 obj_09 obj_04)
    (pred_5 obj_09)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_14)
    (pred_4 obj_13)
    (pred_6 obj_13 obj_14)
    (pred_4 obj_11)
    (pred_6 obj_11 obj_14)
    (pred_3 obj_02 obj_05)
    (pred_3 obj_04 obj_14)
    (pred_3 obj_05 obj_08)
    (pred_3 obj_08 obj_01)
    (pred_3 obj_01 obj_04)
)
 (:goal
  (and
   (pred_1 obj_07)
   (pred_1 obj_13)
   (pred_1 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_13)) (not (pred_1 obj_11))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_02)))
  )
)
)
