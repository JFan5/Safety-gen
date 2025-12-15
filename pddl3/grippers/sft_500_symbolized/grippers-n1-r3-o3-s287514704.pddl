(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_05 - type_1
obj_06 obj_07 - type_3
obj_02 obj_08 obj_03 - type_2
obj_09 obj_04 obj_01 - object)
(:init
(pred_4 obj_05 obj_03)
(pred_2 obj_05 obj_06)
(pred_2 obj_05 obj_07)
(pred_1 obj_09 obj_03)
(pred_1 obj_04 obj_03)
(pred_1 obj_01 obj_08)
)
(:goal
(and
(pred_1 obj_09 obj_02)
(pred_1 obj_04 obj_08)
(pred_1 obj_01 obj_03)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_05 ?b obj_07))))
)
)