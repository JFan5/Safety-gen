(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_10 - type_1
obj_07 obj_05 - type_3
obj_04 obj_06 obj_02 obj_08 - type_2
obj_09 obj_01 obj_03 - object)
(:init
(pred_4 obj_10 obj_02)
(pred_2 obj_10 obj_07)
(pred_2 obj_10 obj_05)
(pred_3 obj_09 obj_04)
(pred_3 obj_01 obj_04)
(pred_3 obj_03 obj_02)
)
(:goal
(and
(pred_3 obj_09 obj_02)
(pred_3 obj_01 obj_04)
(pred_3 obj_03 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_10 ?b obj_05))))
)
)