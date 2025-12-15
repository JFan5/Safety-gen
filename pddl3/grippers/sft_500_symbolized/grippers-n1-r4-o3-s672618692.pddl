(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_05 - type_3
obj_02 obj_03 - type_1
obj_01 obj_09 obj_07 obj_04 - type_2
obj_08 obj_10 obj_06 - object)
(:init
(pred_1 obj_05 obj_09)
(pred_3 obj_05 obj_02)
(pred_3 obj_05 obj_03)
(pred_4 obj_08 obj_09)
(pred_4 obj_10 obj_01)
(pred_4 obj_06 obj_07)
)
(:goal
(and
(pred_4 obj_08 obj_07)
(pred_4 obj_10 obj_01)
(pred_4 obj_06 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_05 ?b obj_02))))
)
)