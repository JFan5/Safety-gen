(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_09 - type_2
obj_08 obj_03 obj_12 obj_11 - type_1
obj_01 obj_10 obj_02 - type_3
obj_06 obj_07 obj_05 - object)
(:init
(pred_1 obj_04 obj_01)
(pred_4 obj_04 obj_08)
(pred_4 obj_04 obj_03)
(pred_1 obj_09 obj_10)
(pred_4 obj_09 obj_12)
(pred_4 obj_09 obj_11)
(pred_3 obj_06 obj_10)
(pred_3 obj_07 obj_01)
(pred_3 obj_05 obj_01)
)
(:goal
(and
(pred_3 obj_06 obj_10)
(pred_3 obj_07 obj_10)
(pred_3 obj_05 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_04 obj_10) (pred_1 obj_09 obj_10))))
  )
)
)