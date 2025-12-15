(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_05 obj_11 - type_1
obj_06 obj_10 obj_01 obj_08 - type_3
obj_07 obj_13 obj_09 obj_02 - type_2
obj_03 obj_12 obj_04 obj_14 - object)
(:init
(pred_3 obj_05 obj_02)
(pred_4 obj_05 obj_06)
(pred_4 obj_05 obj_10)
(pred_3 obj_11 obj_09)
(pred_4 obj_11 obj_01)
(pred_4 obj_11 obj_08)
(pred_2 obj_03 obj_13)
(pred_2 obj_12 obj_07)
(pred_2 obj_04 obj_02)
(pred_2 obj_14 obj_13)
)
(:goal
(and
(pred_2 obj_03 obj_09)
(pred_2 obj_12 obj_09)
(pred_2 obj_04 obj_07)
(pred_2 obj_14 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_05 obj_07) (pred_3 obj_11 obj_07))))
    (always (not (and (pred_3 obj_05 obj_13) (pred_3 obj_11 obj_13))))
  )
)
)