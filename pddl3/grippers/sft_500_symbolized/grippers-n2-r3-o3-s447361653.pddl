(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_04 - type_1
obj_02 obj_08 obj_09 obj_01 - type_2
obj_06 obj_11 obj_10 - type_3
obj_12 obj_03 obj_07 - object)
(:init
(pred_3 obj_05 obj_11)
(pred_2 obj_05 obj_02)
(pred_2 obj_05 obj_08)
(pred_3 obj_04 obj_10)
(pred_2 obj_04 obj_09)
(pred_2 obj_04 obj_01)
(pred_1 obj_12 obj_06)
(pred_1 obj_03 obj_10)
(pred_1 obj_07 obj_10)
)
(:goal
(and
(pred_1 obj_12 obj_10)
(pred_1 obj_03 obj_06)
(pred_1 obj_07 obj_10)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_05 obj_10) (pred_3 obj_04 obj_10))))
  )
)
)