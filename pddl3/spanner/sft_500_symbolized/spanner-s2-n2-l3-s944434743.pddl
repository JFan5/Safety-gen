; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 944434743 --problem-name spanner-s2-n2-l3-s944434743
(define (problem spanner-s2-n2-l3-s944434743)
 (:domain spanner)
 (:objects 
     obj_06 - type_1
     obj_07 obj_10 - type_2
     obj_05 obj_04 - type_4
     obj_01 obj_02 obj_08 - type_3
     obj_03 obj_09 - type_3
    )
 (:init 
    (pred_2 obj_06 obj_03)
    (pred_2 obj_07 obj_02)
    (pred_6 obj_07)
    (pred_2 obj_10 obj_02)
    (pred_6 obj_10)
    (pred_5 obj_05)
    (pred_2 obj_05 obj_09)
    (pred_5 obj_04)
    (pred_2 obj_04 obj_09)
    (pred_1 obj_03 obj_01)
    (pred_1 obj_08 obj_09)
    (pred_1 obj_01 obj_02)
    (pred_1 obj_02 obj_08)
)
 (:goal
  (and
   (pred_3 obj_05)
   (pred_3 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_05)) (not (pred_3 obj_04))))
    (forall (?m - type_1) (at-most-once (pred_2 ?m obj_03)))
  )
)
)
