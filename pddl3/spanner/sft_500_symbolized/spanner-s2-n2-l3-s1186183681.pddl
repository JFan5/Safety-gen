; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1186183681 --problem-name spanner-s2-n2-l3-s1186183681
(define (problem spanner-s2-n2-l3-s1186183681)
 (:domain spanner)
 (:objects 
     obj_09 - type_1
     obj_01 obj_10 - type_4
     obj_05 obj_02 - type_3
     obj_06 obj_04 obj_08 - type_2
     obj_03 obj_07 - type_2
    )
 (:init 
    (pred_4 obj_09 obj_03)
    (pred_4 obj_01 obj_04)
    (pred_5 obj_01)
    (pred_4 obj_10 obj_04)
    (pred_5 obj_10)
    (pred_3 obj_05)
    (pred_4 obj_05 obj_07)
    (pred_3 obj_02)
    (pred_4 obj_02 obj_07)
    (pred_6 obj_03 obj_06)
    (pred_6 obj_08 obj_07)
    (pred_6 obj_06 obj_04)
    (pred_6 obj_04 obj_08)
)
 (:goal
  (and
   (pred_1 obj_05)
   (pred_1 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_05)) (not (pred_1 obj_02))))
    (forall (?m - type_1) (at-most-once (pred_4 ?m obj_03)))
  )
)
)
