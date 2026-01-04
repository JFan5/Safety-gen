(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_01 - type_1
obj_07 obj_06 - type_2
obj_04 obj_02 obj_09 - type_3
obj_03 obj_05 obj_08 - object)
(:init
(pred_4 obj_01 obj_02)
(pred_2 obj_01 obj_07)
(pred_2 obj_01 obj_06)
(pred_1 obj_03 obj_02)
(pred_1 obj_05 obj_02)
(pred_1 obj_08 obj_04)
)
(:goal
(and
(pred_1 obj_03 obj_04)
(pred_1 obj_05 obj_02)
(pred_1 obj_08 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_01 ?b obj_07))))
)
)