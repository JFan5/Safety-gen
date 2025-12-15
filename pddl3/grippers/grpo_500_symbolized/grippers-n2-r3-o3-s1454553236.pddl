(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_12 obj_05 - type_1
obj_03 obj_06 obj_08 obj_09 - type_3
obj_02 obj_01 obj_10 - type_2
obj_04 obj_07 obj_11 - object)
(:init
(pred_3 obj_12 obj_01)
(pred_4 obj_12 obj_03)
(pred_4 obj_12 obj_06)
(pred_3 obj_05 obj_10)
(pred_4 obj_05 obj_08)
(pred_4 obj_05 obj_09)
(pred_2 obj_04 obj_01)
(pred_2 obj_07 obj_02)
(pred_2 obj_11 obj_02)
)
(:goal
(and
(pred_2 obj_04 obj_01)
(pred_2 obj_07 obj_10)
(pred_2 obj_11 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_12 obj_10) (pred_3 obj_05 obj_10))))
  )
)
)