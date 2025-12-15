(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_04 - type_2
obj_02 obj_09 - type_3
obj_06 obj_01 obj_07 - type_1
obj_03 obj_08 obj_05 - object)
(:init
(pred_2 obj_04 obj_06)
(pred_3 obj_04 obj_02)
(pred_3 obj_04 obj_09)
(pred_1 obj_03 obj_07)
(pred_1 obj_08 obj_01)
(pred_1 obj_05 obj_06)
)
(:goal
(and
(pred_1 obj_03 obj_01)
(pred_1 obj_08 obj_07)
(pred_1 obj_05 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_04 ?b obj_02))))
)
)