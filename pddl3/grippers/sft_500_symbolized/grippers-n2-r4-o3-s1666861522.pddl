(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_02 - type_1
obj_06 obj_04 obj_01 obj_13 - type_2
obj_10 obj_09 obj_08 obj_11 - type_3
obj_03 obj_12 obj_05 - object)
(:init
(pred_1 obj_07 obj_11)
(pred_3 obj_07 obj_06)
(pred_3 obj_07 obj_04)
(pred_1 obj_02 obj_10)
(pred_3 obj_02 obj_01)
(pred_3 obj_02 obj_13)
(pred_2 obj_03 obj_09)
(pred_2 obj_12 obj_08)
(pred_2 obj_05 obj_11)
)
(:goal
(and
(pred_2 obj_03 obj_10)
(pred_2 obj_12 obj_08)
(pred_2 obj_05 obj_10)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_07 obj_10) (pred_1 obj_02 obj_10))))
  )
)
)