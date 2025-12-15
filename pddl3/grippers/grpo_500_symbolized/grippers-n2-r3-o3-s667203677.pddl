(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_10 obj_05 - type_1
obj_07 obj_11 obj_02 obj_09 - type_3
obj_12 obj_06 obj_08 - type_2
obj_01 obj_03 obj_04 - object)
(:init
(pred_3 obj_10 obj_12)
(pred_4 obj_10 obj_07)
(pred_4 obj_10 obj_11)
(pred_3 obj_05 obj_08)
(pred_4 obj_05 obj_02)
(pred_4 obj_05 obj_09)
(pred_2 obj_01 obj_06)
(pred_2 obj_03 obj_08)
(pred_2 obj_04 obj_06)
)
(:goal
(and
(pred_2 obj_01 obj_12)
(pred_2 obj_03 obj_08)
(pred_2 obj_04 obj_06)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_10 obj_06) (pred_3 obj_05 obj_06))))
  )
)
)