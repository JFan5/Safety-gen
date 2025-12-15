(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_03 - type_3
obj_07 obj_02 - type_1
obj_01 obj_09 obj_06 obj_04 - type_2
obj_05 obj_08 obj_10 - object)
(:init
(pred_2 obj_03 obj_06)
(pred_4 obj_03 obj_07)
(pred_4 obj_03 obj_02)
(pred_3 obj_05 obj_01)
(pred_3 obj_08 obj_09)
(pred_3 obj_10 obj_06)
)
(:goal
(and
(pred_3 obj_05 obj_04)
(pred_3 obj_08 obj_06)
(pred_3 obj_10 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_03 ?b obj_02))))
)
)