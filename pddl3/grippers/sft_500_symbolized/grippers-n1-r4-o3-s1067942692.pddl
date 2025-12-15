(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_08 - type_3
obj_03 obj_02 - type_1
obj_09 obj_04 obj_07 obj_06 - type_2
obj_05 obj_01 obj_10 - object)
(:init
(pred_3 obj_08 obj_06)
(pred_1 obj_08 obj_03)
(pred_1 obj_08 obj_02)
(pred_4 obj_05 obj_06)
(pred_4 obj_01 obj_09)
(pred_4 obj_10 obj_09)
)
(:goal
(and
(pred_4 obj_05 obj_06)
(pred_4 obj_01 obj_07)
(pred_4 obj_10 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_08 ?b obj_02))))
)
)