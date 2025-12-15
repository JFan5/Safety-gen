(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_03 - type_2
obj_02 obj_07 - type_1
obj_05 obj_04 obj_08 - type_3
obj_09 obj_01 obj_06 - object)
(:init
(pred_3 obj_03 obj_04)
(pred_4 obj_03 obj_02)
(pred_4 obj_03 obj_07)
(pred_1 obj_09 obj_04)
(pred_1 obj_01 obj_04)
(pred_1 obj_06 obj_05)
)
(:goal
(and
(pred_1 obj_09 obj_04)
(pred_1 obj_01 obj_05)
(pred_1 obj_06 obj_08)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_03 ?b obj_07))))
)
)