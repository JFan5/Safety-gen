(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_04 - type_1
obj_06 obj_12 obj_02 obj_09 - type_3
obj_01 obj_05 obj_07 - type_2
obj_10 obj_03 obj_11 - object)
(:init
(pred_3 obj_08 obj_01)
(pred_4 obj_08 obj_06)
(pred_4 obj_08 obj_12)
(pred_3 obj_04 obj_05)
(pred_4 obj_04 obj_02)
(pred_4 obj_04 obj_09)
(pred_2 obj_10 obj_01)
(pred_2 obj_03 obj_01)
(pred_2 obj_11 obj_07)
)
(:goal
(and
(pred_2 obj_10 obj_07)
(pred_2 obj_03 obj_05)
(pred_2 obj_11 obj_05)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_08 obj_05) (pred_3 obj_04 obj_05))))
    (always (not (and (pred_3 obj_08 obj_07) (pred_3 obj_04 obj_07))))
  )
)
)